From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 06/11] m68k: Atari EtherNAT - use netdev_mc_count and netdev_mc_empty when appropriate
Date: Wed, 26 May 2010 19:48:48 +0200
Message-ID: <1274896133-19590-7-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:43386 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757380Ab0EZRtT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:19 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 4cd24eaf0c6ee7f0242e34ee77ec899f255e66b5 ("net: use netdev_mc_count
and netdev_mc_empty when appropriate")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 40a3774..f5aeb62 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1451,7 +1451,7 @@ static void smc_set_multicast_list(struct net_device *dev)
 	 * I don't need to zero the multicast table, because the flag is
 	 * checked before the table is
 	 */
-	else if (dev->flags & IFF_ALLMULTI || dev->mc_count > 16) {
+	else if (dev->flags & IFF_ALLMULTI || netdev_mc_count(dev) > 16) {
 		DBG(2, "%s: RCR_ALMUL\n", dev->name);
 		lp->rcr_cur_mode |= RCR_ALMUL;
 	}
@@ -1468,7 +1468,7 @@ static void smc_set_multicast_list(struct net_device *dev)
 	 * the number of the 8 bit register, while the low 3 bits are the bit
 	 * within that register.
 	 */
-	else if (dev->mc_count)  {
+	else if (!netdev_mc_empty(dev)) {
 		int i;
 		struct dev_mc_list *cur_addr;
 
@@ -1479,7 +1479,7 @@ static void smc_set_multicast_list(struct net_device *dev)
 		memset(multicast_table, 0, sizeof(multicast_table));
 
 		cur_addr = dev->mc_list;
-		for (i = 0; i < dev->mc_count; i++, cur_addr = cur_addr->next) {
+		for (i = 0; i < netdev_mc_count(dev); i++, cur_addr = cur_addr->next) {
 			int position;
 
 			/* do we have a pointer here? */
-- 
1.7.0.4
