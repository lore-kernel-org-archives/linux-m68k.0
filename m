From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: zorro8390 (was: Re: Debian kernel 2.6.38-5)
Date: Mon, 9 May 2011 22:28:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105092225170.14902@ayla.of.borg>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol> <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org> <20110508200802.GB16281@chumley.earth.sol>
 <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:41829 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460Ab1EIU20 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2011 16:28:26 -0400
In-Reply-To: <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, 9 May 2011, Finn Thain wrote:
> On Sun, 8 May 2011, Christian T. Steigies wrote:
> > [  130.870000] eth0: trigger_send() called with the transmitter busy.
> > [  132.240000] ------------[ cut here ]------------
> > [  132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watchdog+0x1ac/0x1cc()
> > [  132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
> 
> Looks a lot like this problem:
> 
> http://patchwork.ozlabs.org/patch/27774/

Does the patch below fix it?
If yes, hydra and ne-h8300 are probably affected, too, as they include
lib8390.c theirselves and are linked with 8390.o.

>From 7e1d9c48bda247d77e7d478d43fc0b9dd1d6c515 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 May 2011 22:19:31 +0200
Subject: [PATCH] zorro8390: Fix regression caused during net_device_ops conversion

Changeset b6114794a1c394534659f4a17420e48cf23aa922 ("zorro8390: convert to
net_device_ops") broke zorro8390 by adding 8390.o to the link. That
meant that lib8390.c was included twice, once in zorro8390.c and once in
8390.c, subject to different macros. This patch reverts that by
avoiding the wrappers in 8390.c.

Fix based on commit 217cbfa856dc1cbc2890781626c4032d9e3ec59f ("mac8390: fix
regression caused during net_device_ops conversion) and
4e0168fa4842e27795a75b205a510f25b62181d9 ("mac8390: fix build with
NET_POLL_CONTROLLER").

Reported-by: Christian T. Steigies <cts@debian.org>
Suggested-by: Finn Thain <fthain@telegraphics.com.au>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/Makefile    |    2 +-
 drivers/net/zorro8390.c |   12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 9ba2838..501fe36 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -219,7 +219,7 @@ obj-$(CONFIG_SC92031) += sc92031.o
 obj-$(CONFIG_LP486E) += lp486e.o
 
 obj-$(CONFIG_ETH16I) += eth16i.o
-obj-$(CONFIG_ZORRO8390) += zorro8390.o 8390.o
+obj-$(CONFIG_ZORRO8390) += zorro8390.o
 obj-$(CONFIG_HPLANCE) += hplance.o 7990.o
 obj-$(CONFIG_MVME147_NET) += mvme147.o 7990.o
 obj-$(CONFIG_EQUALIZER) += eql.o
diff --git a/drivers/net/zorro8390.c b/drivers/net/zorro8390.c
index b78a38d..8c7c522 100644
--- a/drivers/net/zorro8390.c
+++ b/drivers/net/zorro8390.c
@@ -126,7 +126,7 @@ static int __devinit zorro8390_init_one(struct zorro_dev *z,
 
     board = z->resource.start;
     ioaddr = board+cards[i].offset;
-    dev = alloc_ei_netdev();
+    dev = ____alloc_ei_netdev(0);
     if (!dev)
 	return -ENOMEM;
     if (!request_mem_region(ioaddr, NE_IO_EXTENT*2, DRV_NAME)) {
@@ -146,15 +146,15 @@ static int __devinit zorro8390_init_one(struct zorro_dev *z,
 static const struct net_device_ops zorro8390_netdev_ops = {
 	.ndo_open		= zorro8390_open,
 	.ndo_stop		= zorro8390_close,
-	.ndo_start_xmit		= ei_start_xmit,
-	.ndo_tx_timeout		= ei_tx_timeout,
-	.ndo_get_stats		= ei_get_stats,
-	.ndo_set_multicast_list = ei_set_multicast_list,
+	.ndo_start_xmit		= __ei_start_xmit,
+	.ndo_tx_timeout		= __ei_tx_timeout,
+	.ndo_get_stats		= __ei_get_stats,
+	.ndo_set_multicast_list = __ei_set_multicast_list,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address 	= eth_mac_addr,
 	.ndo_change_mtu		= eth_change_mtu,
 #ifdef CONFIG_NET_POLL_CONTROLLER
-	.ndo_poll_controller	= ei_poll,
+	.ndo_poll_controller	= __ei_poll,
 #endif
 };
 
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
