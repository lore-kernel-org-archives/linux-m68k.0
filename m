From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: EtherNEC - Convert ETHER_ADDR_LEN uses to ETH_ALEN
Date: Fri, 20 Jan 2012 19:57:23 +0100
Message-ID: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:33212 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753476Ab2ATS50 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 20 Jan 2012 13:57:26 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 104bf3fb963cbc39c6675b23d46d2c9ab3f311d8 ("ethernet: Convert
ETHER_ADDR_LEN uses to ETH_ALEN")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/8390/atari_ethernec.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/8390/atari_ethernec.c b/drivers/net/ethernet/8390/atari_ethernec.c
index 4fb22ce..086d968 100644
--- a/drivers/net/ethernet/8390/atari_ethernec.c
+++ b/drivers/net/ethernet/8390/atari_ethernec.c
@@ -645,12 +645,12 @@ static int __init ne_probe1(struct net_device *dev, int ioaddr)
 #ifdef CONFIG_PLAT_MAPPI
 	outb_p(E8390_NODMA + E8390_PAGE1 + E8390_STOP,
 		ioaddr + E8390_CMD); /* 0x61 */
-	for (i = 0; i < ETHER_ADDR_LEN; i++) {
+	for (i = 0; i < ETH_ALEN; i++) {
 		dev->dev_addr[i] = SA_prom[i] = inb_p(ioaddr + EN1_PHYS_SHIFT(i));
 		printk(" %2.2x", SA_prom[i]);
 	}
 #else
-	for (i = 0; i < ETHER_ADDR_LEN; i++) {
+	for (i = 0; i < ETH_ALEN; i++) {
 		printk(" %2.2x", SA_prom[i]);
 		dev->dev_addr[i] = SA_prom[i];
 	}
-- 
1.7.0.4
