From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - restore MTU change operation
Date: Wed, 23 Dec 2009 20:15:45 +0100
Message-ID: <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 635ecaa70e862f85f652581305fe0074810893be ("netdev: restore MTU
change operation")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 3b53ff9..86dbe19 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1718,6 +1718,7 @@ static const struct net_device_ops smc_netdev_ops = {
 	.ndo_start_xmit		= smc_hard_start_xmit,
 	.ndo_tx_timeout		= smc_timeout,
 	.ndo_set_multicast_list	= smc_set_multicast_list,
+	.ndo_change_mtu		= eth_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= eth_mac_addr,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-- 
1.6.0.4
