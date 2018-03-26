From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] net: fec: set dma_coherent_mask
Date: Mon, 26 Mar 2018 23:36:26 +1000
Message-ID: <1522071386-29743-1-git-send-email-gerg@linux-m68k.org>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

As of commit 205e1b7f51e4 ("dma-mapping: warn when there is no
coherent_dma_mask") the Freescale FEC driver is issuing the following
warning on driver initialization on ColdFire systems:

WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 0x40159e20
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc7-dirty #4
Stack from 41833dd8:
        41833dd8 40259c53 40025534 40279e26 00000003 00000000 4004e514 41827000
        400255de 40244e42 00000204 40159e20 00000009 00000000 00000000 4024531d
        40159e20 40244e42 00000204 00000000 00000000 00000000 00000007 00000000
        00000000 40279e26 4028d040 40226576 4003ae88 40279e26 418273f6 41833ef8
        7fffffff 418273f2 41867028 4003c9a2 4180ac6c 00000004 41833f8c 4013e71c
        40279e1c 40279e26 40226c16 4013ced2 40279e26 40279e58 4028d040 00000000
Call Trace:
        [<40025534>] 0x40025534
 [<4004e514>] 0x4004e514
 [<400255de>] 0x400255de
 [<40159e20>] 0x40159e20
 [<40159e20>] 0x40159e20

It is not fatal, the driver and the system continue to function normally.

As per the warning the coherent_dma_mask is not set on this device.
There is nothing special about the DMA memory coherency on this hardware
so we can just set the mask to 32bits during probe.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 drivers/net/ethernet/freescale/fec_main.c | 2 ++
 1 file changed, 2 insertions(+)

Is this the best way to handle this problem?
Comments welcome...

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index d4604bc..3cb130a 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2702,6 +2702,8 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
 	int ret = 0;
 	struct fec_enet_priv_tx_q *txq;
 
+	dma_set_coherent_mask(&fep->pdev->dev, DMA_BIT_MASK(32));
+
 	for (i = 0; i < fep->num_tx_queues; i++) {
 		txq = kzalloc(sizeof(*txq), GFP_KERNEL);
 		if (!txq) {
-- 
1.9.1
