From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH net v4 04/13] net/macmace: Fix and clean up log messages
Date: Sun, 11 Feb 2018 22:08:43 -0500 (EST)
Message-ID: <4ed518005058fb81e67be8408d94698a7ad9b593.1518397634.git.fthain@telegraphics.com.au>
References: <cover.1518397634.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1518397634.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Don't log the unexpanded "eth%d" format string.
Log the chip revision in the probe message (consistent with mace.c).
Drop redundant debug messages for FIFO events recorded in the
interface statistics (also consistent with mace.c).

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/net/ethernet/apple/macmace.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/apple/macmace.c b/drivers/net/ethernet/apple/macmace.c
index f17a160dbff2..cfd8f3d8a94c 100644
--- a/drivers/net/ethernet/apple/macmace.c
+++ b/drivers/net/ethernet/apple/macmace.c
@@ -247,8 +247,8 @@ static int mace_probe(struct platform_device *pdev)
 	dev->netdev_ops		= &mace_netdev_ops;
 	dev->watchdog_timeo	= TX_TIMEOUT;
 
-	printk(KERN_INFO "%s: 68K MACE, hardware address %pM\n",
-	       dev->name, dev->dev_addr);
+	pr_info("Onboard MACE, hardware address %pM, chip revision 0x%04X\n",
+		dev->dev_addr, mp->chipid);
 
 	err = register_netdev(dev);
 	if (!err)
@@ -589,7 +589,6 @@ static irqreturn_t mace_interrupt(int irq, void *dev_id)
 			else if (fs & (UFLO|LCOL|RTRY)) {
 				++dev->stats.tx_aborted_errors;
 				if (mb->xmtfs & UFLO) {
-					printk(KERN_ERR "%s: DMA underrun.\n", dev->name);
 					dev->stats.tx_fifo_errors++;
 					mace_txdma_reset(dev);
 				}
@@ -644,10 +643,8 @@ static void mace_dma_rx_frame(struct net_device *dev, struct mace_frame *mf)
 
 	if (frame_status & (RS_OFLO | RS_CLSN | RS_FRAMERR | RS_FCSERR)) {
 		dev->stats.rx_errors++;
-		if (frame_status & RS_OFLO) {
-			printk(KERN_DEBUG "%s: fifo overflow.\n", dev->name);
+		if (frame_status & RS_OFLO)
 			dev->stats.rx_fifo_errors++;
-		}
 		if (frame_status & RS_CLSN)
 			dev->stats.collisions++;
 		if (frame_status & RS_FRAMERR)
-- 
2.13.6
