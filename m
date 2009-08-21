From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] ethernec: Convert to net_device_ops
Date: Fri, 21 Aug 2009 22:30:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0908212229550.18927@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile tested only

 drivers/net/atari_ethernec.c |   23 +----------------------
 1 files changed, 1 insertions(+), 22 deletions(-)

diff --git a/drivers/net/atari_ethernec.c b/drivers/net/atari_ethernec.c
index 05b5e2e..4fb22ce 100644
--- a/drivers/net/atari_ethernec.c
+++ b/drivers/net/atari_ethernec.c
@@ -199,9 +199,6 @@ bad_clone_list[] __initdata = {
 static int ne_probe1(struct net_device *dev, int ioaddr);
 static int ne_probe_isapnp(struct net_device *dev);
 
-static int ne_open(struct net_device *dev);
-static int ne_close(struct net_device *dev);
-
 static void ne_reset_8390(struct net_device *dev);
 static void ne_get_8390_hdr(struct net_device *dev, struct e8390_pkt_hdr *hdr,
 			    int ring_page);
@@ -680,11 +677,7 @@ static int __init ne_probe1(struct net_device *dev, int ioaddr)
 	ei_status.block_output = &ne_block_output;
 	ei_status.get_8390_hdr = &ne_get_8390_hdr;
 	ei_status.priv = 0;
-	dev->open = &ne_open;
-	dev->stop = &ne_close;
-#ifdef CONFIG_NET_POLL_CONTROLLER
-	dev->poll_controller = ei_poll;
-#endif
+	dev->netdev_ops = &ei_netdev_ops;
 	NS8390_init(dev, 0);
 
 	ret = register_netdev(dev);
@@ -699,20 +692,6 @@ err_out:
 	return ret;
 }
 
-static int ne_open(struct net_device *dev)
-{
-	ei_open(dev);
-	return 0;
-}
-
-static int ne_close(struct net_device *dev)
-{
-	if (ei_debug > 1)
-		printk(KERN_DEBUG "%s: Shutting down ethercard.\n", dev->name);
-	ei_close(dev);
-	return 0;
-}
-
 /* Hard reset the card.  This used to pause for the same period that a
    8390 reset command required, but that shouldn't be necessary. */
 
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
