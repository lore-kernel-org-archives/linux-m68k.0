From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/4] m68k/atari: ARAnyM - Prepare nfeth for submission
Date: Sun, 23 Jan 2011 17:31:34 +0100
Message-ID: <1295800294-13216-4-git-send-email-geert@linux-m68k.org>
References: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Stehlik <pstehlik@sophics.cz>

  - Break too long lines,
  - Make needlessly global functions static,
  - Make version[] const,
  - Use pr_*(),
  - Use net_device_stats from struct net_device instead of our own,
  - Propagate error code from request_irq(),
  - Remove unused variable "handled",
  - Add missing MODULE_LICENSE.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>
---
 arch/m68k/emu/nfeth.c |   92 ++++++++++++++++++++----------------------------
 1 files changed, 38 insertions(+), 54 deletions(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index 8c41f6c..bf15453 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -16,18 +16,18 @@
 #include <asm/virtconvert.h>
 
 enum {
-	GET_VERSION = 0,	/* no parameters, return NFAPI_VERSION in d0 */
-	XIF_INTLEVEL,		/* no parameters, return Interrupt Level in d0 */
-	XIF_IRQ,		/* acknowledge interrupt from host */
-	XIF_START,		/* (ethX), called on 'ifup', start receiver thread */
-	XIF_STOP,		/* (ethX), called on 'ifdown', stop the thread */
-	XIF_READLENGTH,		/* (ethX), return size of network data block to read */
-	XIF_READBLOCK,		/* (ethX, buffer, size), read block of network data */
-	XIF_WRITEBLOCK,		/* (ethX, buffer, size), write block of network data */
-	XIF_GET_MAC,		/* (ethX, buffer, size), return MAC HW addr in buffer */
-	XIF_GET_IPHOST,		/* (ethX, buffer, size), return IP address of host */
-	XIF_GET_IPATARI,	/* (ethX, buffer, size), return IP address of atari */
-	XIF_GET_NETMASK		/* (ethX, buffer, size), return IP netmask */
+	GET_VERSION = 0,/* no parameters, return NFAPI_VERSION in d0 */
+	XIF_INTLEVEL,	/* no parameters, return Interrupt Level in d0 */
+	XIF_IRQ,	/* acknowledge interrupt from host */
+	XIF_START,	/* (ethX), called on 'ifup', start receiver thread */
+	XIF_STOP,	/* (ethX), called on 'ifdown', stop the thread */
+	XIF_READLENGTH,	/* (ethX), return size of network data block to read */
+	XIF_READBLOCK,	/* (ethX, buffer, size), read block of network data */
+	XIF_WRITEBLOCK,	/* (ethX, buffer, size), write block of network data */
+	XIF_GET_MAC,	/* (ethX, buffer, size), return MAC HW addr in buffer */
+	XIF_GET_IPHOST,	/* (ethX, buffer, size), return IP address of host */
+	XIF_GET_IPATARI,/* (ethX, buffer, size), return IP address of atari */
+	XIF_GET_NETMASK	/* (ethX, buffer, size), return IP netmask */
 };
 
 #define DRV_NAME	"nfeth"
@@ -37,9 +37,10 @@ enum {
 #define MAX_UNIT	8
 
 /* These identify the driver base version and may not be removed. */
-static char version[] __devinitdata =
-KERN_INFO DRV_NAME ".c:v" DRV_VERSION " " DRV_RELDATE " S.Opichal, M.Jurik, P.Stehlik\n"
-KERN_INFO "  http://aranym.atari.org/\n";
+static const char version[] __devinitdata =
+	KERN_INFO DRV_NAME ".c:v" DRV_VERSION " " DRV_RELDATE
+	" S.Opichal, M.Jurik, P.Stehlik\n"
+	KERN_INFO " http://aranym.atari.org/\n";
 
 MODULE_AUTHOR("Milan Jurik");
 MODULE_DESCRIPTION("Atari NFeth driver");
@@ -55,26 +56,17 @@ static int nfEtherIRQ;
 
 struct nfeth_private {
 	int ethX;
-	struct net_device_stats	stats;
 };
 
 static struct net_device *nfeth_dev[MAX_UNIT];
 
-int nfeth_open(struct net_device *dev);
-int nfeth_stop(struct net_device *dev);
-irqreturn_t nfeth_interrupt(int irq, void *dev_id);
-int nfeth_xmit(struct sk_buff *skb, struct net_device *dev);
-
-int nfeth_open(struct net_device *dev)
+static int nfeth_open(struct net_device *dev)
 {
 	struct nfeth_private *priv = netdev_priv(dev);
 	int res;
 
 	res = nf_call(nfEtherID + XIF_START, priv->ethX);
 
-	/* Clean statistics */
-	memset(&priv->stats, 0, sizeof(struct net_device_stats));
-
 	pr_debug(DRV_NAME ": open %d\n", res);
 
 	/* Ready for data */
@@ -83,7 +75,7 @@ int nfeth_open(struct net_device *dev)
 	return 0;
 }
 
-int nfeth_stop(struct net_device *dev)
+static int nfeth_stop(struct net_device *dev)
 {
 	struct nfeth_private *priv = netdev_priv(dev);
 
@@ -101,7 +93,6 @@ int nfeth_stop(struct net_device *dev)
 static inline void recv_packet(struct net_device *dev)
 {
 	struct nfeth_private *priv = netdev_priv(dev);
-	int handled = 0;
 	unsigned short pktlen;
 	struct sk_buff *skb;
 
@@ -112,7 +103,7 @@ static inline void recv_packet(struct net_device *dev)
 
 	if (!pktlen) {
 		pr_debug(DRV_NAME ": recv_packet: pktlen == 0\n");
-		priv->stats.rx_errors++;
+		dev->stats.rx_errors++;
 		return;
 	}
 
@@ -120,7 +111,7 @@ static inline void recv_packet(struct net_device *dev)
 	if (!skb) {
 		pr_debug(DRV_NAME
 			 ": recv_packet: out of mem (buf_alloc failed)\n");
-		priv->stats.rx_dropped++;
+		dev->stats.rx_dropped++;
 		return;
 	}
 
@@ -133,15 +124,14 @@ static inline void recv_packet(struct net_device *dev)
 	skb->protocol = eth_type_trans(skb, dev);
 	netif_rx(skb);
 	dev->last_rx = jiffies;
-	priv->stats.rx_packets++;
-	priv->stats.rx_bytes += pktlen;
+	dev->stats.rx_packets++;
+	dev->stats.rx_bytes += pktlen;
 
 	/* and enqueue packet */
-	handled = 1;
 	return;
 }
 
-irqreturn_t nfeth_interrupt(int irq, void *dev_id)
+static irqreturn_t nfeth_interrupt(int irq, void *dev_id)
 {
 	int i, m, mask;
 
@@ -155,7 +145,7 @@ irqreturn_t nfeth_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
+static int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	int len;
 	char *data, shortpkt[ETH_ZLEN];
@@ -176,8 +166,8 @@ int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
 	nf_call(nfEtherID + XIF_WRITEBLOCK, priv->ethX, virt_to_phys(data),
 		len);
 
-	priv->stats.tx_packets++;
-	priv->stats.tx_bytes += len;
+	dev->stats.tx_packets++;
+	dev->stats.tx_bytes += len;
 
 	dev_kfree_skb(skb);
 	return 0;
@@ -185,29 +175,21 @@ int nfeth_xmit(struct sk_buff *skb, struct net_device *dev)
 
 static void nfeth_tx_timeout(struct net_device *dev)
 {
-	struct nfeth_private *priv = netdev_priv(dev);
-	priv->stats.tx_errors++;
+	dev->stats.tx_errors++;
 	netif_wake_queue(dev);
 }
 
-static struct net_device_stats *nfeth_get_stats(struct net_device *dev)
-{
-	struct nfeth_private *priv = netdev_priv(dev);
-	return &priv->stats;
-}
-
 static const struct net_device_ops nfeth_netdev_ops = {
 	.ndo_open		= nfeth_open,
 	.ndo_stop		= nfeth_stop,
 	.ndo_start_xmit		= nfeth_xmit,
 	.ndo_tx_timeout		= nfeth_tx_timeout,
-	.ndo_get_stats		= nfeth_get_stats,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= eth_change_mtu,
 	.ndo_set_mac_address	= eth_mac_addr,
 };
 
-struct net_device * __init nfeth_probe(int unit)
+static struct net_device * __init nfeth_probe(int unit)
 {
 	struct net_device *dev;
 	struct nfeth_private *priv;
@@ -247,10 +229,10 @@ struct net_device * __init nfeth_probe(int unit)
 	return dev;
 }
 
-int __init nfeth_init(void)
+static int __init nfeth_init(void)
 {
 	long ver;
-	int i;
+	int error, i;
 
 	nfEtherID = nf_get_id("ETHERNET");
 	if (!nfEtherID)
@@ -260,11 +242,11 @@ int __init nfeth_init(void)
 	pr_info("nfeth API %lu\n", ver);
 
 	nfEtherIRQ = nf_call(nfEtherID + XIF_INTLEVEL);
-	if (request_irq(nfEtherIRQ, nfeth_interrupt, IRQF_SHARED,
-			"eth emu", nfeth_interrupt)) {
-		printk(KERN_ERR "nfeth: request for irq %d failed",
-		       nfEtherIRQ);
-		return -ENODEV;
+	error = request_irq(nfEtherIRQ, nfeth_interrupt, IRQF_SHARED,
+			    "eth emu", nfeth_interrupt);
+	if (error) {
+		pr_err("nfeth: request for irq %d failed", nfEtherIRQ);
+		return error;
 	}
 
 	for (i = 0; i < MAX_UNIT; i++)
@@ -273,7 +255,7 @@ int __init nfeth_init(void)
 	return 0;
 }
 
-void __exit nfeth_cleanup(void)
+static void __exit nfeth_cleanup(void)
 {
 	int i;
 
@@ -288,3 +270,5 @@ void __exit nfeth_cleanup(void)
 
 module_init(nfeth_init);
 module_exit(nfeth_cleanup);
+
+MODULE_LICENSE("GPL");
-- 
1.7.0.4
