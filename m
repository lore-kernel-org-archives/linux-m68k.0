From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - convert print_mac to %pM
Date: Wed, 23 Dec 2009 20:15:49 +0100
Message-ID: <1261595749-23531-6-git-send-email-geert@linux-m68k.org>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0 ("net: convert print_mac
to %pM")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index b579ead..0b92b94 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1824,7 +1824,6 @@ static int __devinit smc_probe(struct net_device *dev, void __iomem *ioaddr,
 	int retval;
 	unsigned int val, revision_register;
 	const char *version_string;
-	DECLARE_MAC_BUF(mac);
 
 	DBG(2, "%s: %s\n", CARDNAME, __func__);
 
@@ -2016,12 +2015,12 @@ static int __devinit smc_probe(struct net_device *dev, void __iomem *ioaddr,
 			printk("%s: Invalid ethernet MAC address.  Please "
 			       "set using ifconfig\n", dev->name);
 			random_ether_addr(dev->dev_addr);
-			printk(KERN_INFO "%s: Ethernet addr set (random): %s\n",
-			       dev->name, print_mac(mac, dev->dev_addr));
+			printk(KERN_INFO "%s: Ethernet addr set (random): %pM\n",
+			       dev->name, dev->dev_addr);
 		} else {
 			/* Print the Ethernet address */
-			printk("%s: Ethernet addr: %s\n",
-			       dev->name, print_mac(mac, dev->dev_addr));
+			printk("%s: Ethernet addr: %pM\n",
+			       dev->name, dev->dev_addr);
 		}
 
 		if (lp->phy_type == 0) {
-- 
1.6.0.4
