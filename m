From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Tue, 19 Jul 2011 23:55:40 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107192341160.189@ibook.intranet>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
 <alpine.OSX.2.00.1107181901080.145@ibook.local> <alpine.OSX.2.00.1107191754510.189@ibook.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1107191754510.189@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Tue, 19 Jul 2011, I wrote:

> 
> I tested 2.6.29 and mac8390 fails like 2.6.39 in this system. This also 
> required a backport of the patch discussed earlier in this thread, since 
> 2.6.29 has commit ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc.
> 
> I also tested 2.6.19 which pre-dates that commit, and it too failed in 
> the same way.
> 
> Anyway, the mac8390 driver issue here may be unrelated to your zorro8390 
> bug (and may simply be a quirk of this particular card).

It turns out that the mac8390 issue is unrelated. The cause was the old 
nubus interrupt problem. I worked around it and after that the driver 
passed a 1 hour smoke test (several simultaneous ping floods running 
locally and remotely with neglible packet loss).

So, what's the difference between mac8390 and zorro8390? In the mac8390 
case, there is only one way for lib8390.c symbols to end up in the link, 
and that is mac8390.

On amiga, it is a different story: there's at least apne, zorro8390 and 
the ISA NE-2000 drivers that could be pulling in these symbols. So I think 
you should try this patch, which takes the same approach that's used in 
ax88796.c.

HTH

Finn


Index: linux-2.6.39/drivers/net/zorro8390.c
===================================================================
--- linux-2.6.39.orig/drivers/net/zorro8390.c	2011-05-19 14:06:34.000000000 +1000
+++ linux-2.6.39/drivers/net/zorro8390.c	2011-07-19 23:39:19.000000000 +1000
@@ -34,6 +34,18 @@
 #include <asm/amigaints.h>
 #include <asm/amigahw.h>
 
+/* Rename the lib8390.c functions to prevent ambiguity at link time */
+#define __ei_open zo_ei_open
+#define __ei_close zo_ei_close
+#define __ei_poll zo_ei_poll
+#define __ei_start_xmit zo_ei_start_xmit
+#define __ei_tx_timeout zo_ei_tx_timeout
+#define __ei_get_stats zo_ei_get_stats
+#define __ei_set_multicast_list zo_ei_set_multicast_list
+#define __ei_interrupt zo_ei_interrupt
+#define ____alloc_ei_netdev zo__alloc_ei_netdev
+#define __NS8390_init zo_NS8390_init
+
 #define EI_SHIFT(x)	(ei_local->reg_offset[x])
 #define ei_inb(port)   in_8(port)
 #define ei_outb(val,port)  out_8(port,val)
@@ -85,8 +97,6 @@ static int __devinit zorro8390_init_one(
 static int __devinit zorro8390_init(struct net_device *dev,
 				    unsigned long board, const char *name,
 				    unsigned long ioaddr);
-static int zorro8390_open(struct net_device *dev);
-static int zorro8390_close(struct net_device *dev);
 static void zorro8390_reset_8390(struct net_device *dev);
 static void zorro8390_get_8390_hdr(struct net_device *dev,
 				   struct e8390_pkt_hdr *hdr, int ring_page);
@@ -126,7 +136,7 @@ static int __devinit zorro8390_init_one(
 
     board = z->resource.start;
     ioaddr = board+cards[i].offset;
-    dev = ____alloc_ei_netdev(0);
+    dev = zo__alloc_ei_netdev(0);
     if (!dev)
 	return -ENOMEM;
     if (!request_mem_region(ioaddr, NE_IO_EXTENT*2, DRV_NAME)) {
@@ -144,17 +154,17 @@ static int __devinit zorro8390_init_one(
 }
 
 static const struct net_device_ops zorro8390_netdev_ops = {
-	.ndo_open		= zorro8390_open,
-	.ndo_stop		= zorro8390_close,
-	.ndo_start_xmit		= __ei_start_xmit,
-	.ndo_tx_timeout		= __ei_tx_timeout,
-	.ndo_get_stats		= __ei_get_stats,
-	.ndo_set_multicast_list = __ei_set_multicast_list,
+	.ndo_open		= zo_ei_open,
+	.ndo_stop		= zo_ei_close,
+	.ndo_start_xmit		= zo_ei_start_xmit,
+	.ndo_tx_timeout		= zo_ei_tx_timeout,
+	.ndo_get_stats		= zo_ei_get_stats,
+	.ndo_set_multicast_list = zo_ei_set_multicast_list,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= eth_mac_addr,
 	.ndo_change_mtu		= eth_change_mtu,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= __ei_poll,
+	.ndo_poll_controller	= zo_ei_poll,
 #endif
 };
 
@@ -227,7 +237,7 @@ static int __devinit zorro8390_init(stru
     dev->irq = IRQ_AMIGA_PORTS;
 
     /* Install the Interrupt handler */
-    i = request_irq(IRQ_AMIGA_PORTS, __ei_interrupt, IRQF_SHARED, DRV_NAME, dev);
+    i = request_irq(IRQ_AMIGA_PORTS, zo_ei_interrupt, IRQF_SHARED, DRV_NAME, dev);
     if (i) return i;
 
     for(i = 0; i < ETHER_ADDR_LEN; i++)
@@ -251,7 +261,7 @@ static int __devinit zorro8390_init(stru
     ei_status.reg_offset = zorro8390_offsets;
 
     dev->netdev_ops = &zorro8390_netdev_ops;
-    __NS8390_init(dev, 0);
+    zo_NS8390_init(dev, 0);
     err = register_netdev(dev);
     if (err) {
 	free_irq(IRQ_AMIGA_PORTS, dev);
@@ -264,20 +274,6 @@ static int __devinit zorro8390_init(stru
     return 0;
 }
 
-static int zorro8390_open(struct net_device *dev)
-{
-    __ei_open(dev);
-    return 0;
-}
-
-static int zorro8390_close(struct net_device *dev)
-{
-    if (ei_debug > 1)
-	printk(KERN_DEBUG "%s: Shutting down ethercard.\n", dev->name);
-    __ei_close(dev);
-    return 0;
-}
-
 /* Hard reset the card.  This used to pause for the same period that a
    8390 reset command required, but that shouldn't be necessary. */
 static void zorro8390_reset_8390(struct net_device *dev)
@@ -425,7 +421,7 @@ static void zorro8390_block_output(struc
 		printk(KERN_ERR "%s: timeout waiting for Tx RDC.\n",
 		       dev->name);
 		zorro8390_reset_8390(dev);
-		__NS8390_init(dev,1);
+		zo_NS8390_init(dev,1);
 		break;
 	}
 
