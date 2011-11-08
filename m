From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - remove use of ndo_set_multicast_list in drivers
Date: Tue,  8 Nov 2011 23:16:43 +0100
Message-ID: <1320790603-16041-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:54090 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932411Ab1KHWQt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Nov 2011 17:16:49 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit afc4b13df143122f99a0eb10bfefb216c2806de0 ("net: remove use of
ndo_set_multicast_list in drivers")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/smsc/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/smsc/atari_91C111.c b/drivers/net/ethernet/smsc/atari_91C111.c
index 5c10fd9..09be801 100644
--- a/drivers/net/ethernet/smsc/atari_91C111.c
+++ b/drivers/net/ethernet/smsc/atari_91C111.c
@@ -1715,7 +1715,7 @@ static const struct net_device_ops smc_netdev_ops = {
 	.ndo_stop		= smc_close,
 	.ndo_start_xmit		= smc_hard_start_xmit,
 	.ndo_tx_timeout		= smc_timeout,
-	.ndo_set_multicast_list	= smc_set_multicast_list,
+	.ndo_set_rx_mode	= smc_set_multicast_list,
 	.ndo_change_mtu		= eth_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= eth_mac_addr,
-- 
1.7.0.4
