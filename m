From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/8] aX88796: Fix MAC address reading
Date: Tue, 17 Nov 2015 12:33:10 +1300
Message-ID: <1447716797-20906-2-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:33241 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbbKPXdj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:39 -0500
Received: by padfb7 with SMTP id fb7so26783286pad.0
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:38 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>

From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

To read the MAC address from the (virtual) SAprom. the remote DMA
unit needs to be set up like for every other process access to card-local
memory.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 0443654..7963e1d 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -709,10 +709,16 @@ static int ax_init_dev(struct net_device *dev)
 	if (ax->plat->flags & AXFLG_HAS_EEPROM) {
 		unsigned char SA_prom[32];
 
+		ei_outb(6, ioaddr + EN0_RCNTLO);
+		ei_outb(0, ioaddr + EN0_RCNTHI);
+		ei_outb(0, ioaddr + EN0_RSARLO);
+		ei_outb(0, ioaddr + EN0_RSARHI);
+		ei_outb(E8390_RREAD+E8390_START, ioaddr + NE_CMD);
 		for (i = 0; i < sizeof(SA_prom); i += 2) {
 			SA_prom[i] = ei_inb(ioaddr + NE_DATAPORT);
 			SA_prom[i + 1] = ei_inb(ioaddr + NE_DATAPORT);
 		}
+		ei_outb(ENISR_RDC, ioaddr + EN0_ISR);	/* Ack intr. */
 
 		if (ax->plat->wordlength == 2)
 			for (i = 0; i < 16; i++)
-- 
1.7.0.4
