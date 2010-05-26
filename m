From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 07/11] m68k: Atari EtherNAT - convert multiple drivers to use netdev_for_each_mc_addr
Date: Wed, 26 May 2010 19:48:49 +0200
Message-ID: <1274896133-19590-8-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:34518 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390Ab0EZRtU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:20 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 567ec874d15b478c8eda7e9a5d2dcb05f13f1fb5 ("net: convert multiple
drivers to use netdev_for_each_mc_addr, part6")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index f5aeb62..ac15c3f 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1469,7 +1469,6 @@ static void smc_set_multicast_list(struct net_device *dev)
 	 * within that register.
 	 */
 	else if (!netdev_mc_empty(dev)) {
-		int i;
 		struct dev_mc_list *cur_addr;
 
 		/* table for flipping the order of 3 bits */
@@ -1478,13 +1477,9 @@ static void smc_set_multicast_list(struct net_device *dev)
 		/* start with a table of all zeros: reject all */
 		memset(multicast_table, 0, sizeof(multicast_table));
 
-		cur_addr = dev->mc_list;
-		for (i = 0; i < netdev_mc_count(dev); i++, cur_addr = cur_addr->next) {
+		netdev_for_each_mc_addr(cur_addr, dev) {
 			int position;
 
-			/* do we have a pointer here? */
-			if (!cur_addr)
-				break;
 			/* make sure this is a multicast address -
 		   	   shouldn't this be a given if we have it here ? */
 			if (!(*cur_addr->dmi_addr & 1))
-- 
1.7.0.4
