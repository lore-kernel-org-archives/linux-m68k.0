From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 10/11] m68k: Atari EtherNAT - convert multicast list to list_head
Date: Wed, 26 May 2010 19:48:52 +0200
Message-ID: <1274896133-19590-11-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:43288 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757422Ab0EZRtV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:21 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 22bedad3ce112d5ca1eaf043d4990fa2ed698c87 ("net: convert multicast
list to list_head")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index ee8e5e9..31b4777 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1468,7 +1468,7 @@ static void smc_set_multicast_list(struct net_device *dev)
 	 * within that register.
 	 */
 	else if (!netdev_mc_empty(dev)) {
-		struct dev_mc_list *cur_addr;
+		struct netdev_hw_addr *ha;
 
 		/* table for flipping the order of 3 bits */
 		static const unsigned char invert3[] = {0, 4, 2, 6, 1, 5, 3, 7};
@@ -1476,16 +1476,16 @@ static void smc_set_multicast_list(struct net_device *dev)
 		/* start with a table of all zeros: reject all */
 		memset(multicast_table, 0, sizeof(multicast_table));
 
-		netdev_for_each_mc_addr(cur_addr, dev) {
+		netdev_for_each_mc_addr(ha, dev) {
 			int position;
 
 			/* make sure this is a multicast address -
 		   	   shouldn't this be a given if we have it here ? */
-			if (!(*cur_addr->dmi_addr & 1))
+			if (!(*ha->addr & 1))
 				continue;
 
 			/* only use the low order bits */
-			position = crc32_le(~0, cur_addr->dmi_addr, 6) & 0x3f;
+			position = crc32_le(~0, ha->addr, 6) & 0x3f;
 
 			/* do some messy swapping to put the bit in the right spot */
 			multicast_table[invert3[position&7]] |=
-- 
1.7.0.4
