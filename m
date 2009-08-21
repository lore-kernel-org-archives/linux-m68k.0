From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] aranym: Convert to net_device_ops
Date: Fri, 21 Aug 2009 22:29:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0908212229210.18912@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile test only

 arch/m68k/emu/nfeth.c |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index 5b118e9..f55dfd3 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -196,6 +196,17 @@ static struct net_device_stats *nfeth_get_stats(struct net_device *dev)
 	return &priv->stats;
 }
 
+static const struct net_device_ops nfeth_netdev_ops = {
+	.ndo_open		= nfeth_open,
+	.ndo_stop		= nfeth_stop,
+	.ndo_start_xmit		= nfeth_xmit,
+	.ndo_tx_timeout		= nfeth_tx_timeout,
+	.ndo_get_stats		= nfeth_get_stats,
+	.ndo_validate_addr	= eth_validate_addr,
+	.ndo_change_mtu		= eth_change_mtu,
+	.ndo_set_mac_address	= eth_mac_addr,
+};
+
 struct net_device * __init nfeth_probe(int unit)
 {
 	struct net_device *dev;
@@ -212,11 +223,8 @@ struct net_device * __init nfeth_probe(int unit)
 		return NULL;
 
 	dev->irq = nfEtherIRQ;
-	dev->open = nfeth_open;
-	dev->stop = nfeth_stop;
-	dev->hard_start_xmit = nfeth_xmit;
-	dev->tx_timeout = nfeth_tx_timeout;
-	dev->get_stats = nfeth_get_stats;
+	dev->netdev_ops = &nfeth_netdev_ops;
+
 	dev->flags |= NETIF_F_NO_CSUM;
 	memcpy(dev->dev_addr, mac, ETH_ALEN);
 
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
