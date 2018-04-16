From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 04/10] net: ax88796: Add block_input/output hooks to ax_plat_data
Date: Tue, 17 Apr 2018 10:04:39 +1200
Message-ID: <1523916285-6057-5-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Add platform specific hooks for block transfer reads/writes of packet
buffer data, superseding the default provided ax_block_input/output.
Currently used for m68k Amiga XSurf100.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   10 ++++++++--
 include/net/ax88796.h               |    9 ++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index a4f23ba..9159235 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -758,8 +758,14 @@ static int ax_init_dev(struct net_device *dev)
 #endif
 
 	ei_local->reset_8390 = &ax_reset_8390;
-	ei_local->block_input = &ax_block_input;
-	ei_local->block_output = &ax_block_output;
+	if (ax->plat->block_input)
+		ei_local->block_input = ax->plat->block_input;
+	else
+		ei_local->block_input = &ax_block_input;
+	if (ax->plat->block_output)
+		ei_local->block_output = ax->plat->block_output;
+	else
+		ei_local->block_output = &ax_block_output;
 	ei_local->get_8390_hdr = &ax_get_8390_hdr;
 	ei_local->priv = 0;
 	ei_local->msg_enable = ax_msg_enable;
diff --git a/include/net/ax88796.h b/include/net/ax88796.h
index b9a3bec..26cc459 100644
--- a/include/net/ax88796.h
+++ b/include/net/ax88796.h
@@ -8,10 +8,11 @@
  * published by the Free Software Foundation.
  *
 */
-
 #ifndef __NET_AX88796_PLAT_H
 #define __NET_AX88796_PLAT_H
 
+struct net_device;
+
 #define AXFLG_HAS_EEPROM		(1<<0)
 #define AXFLG_MAC_FROMDEV		(1<<1)	/* device already has MAC */
 #define AXFLG_HAS_93CX6			(1<<2)	/* use eeprom_93cx6 driver */
@@ -26,6 +27,12 @@ struct ax_plat_data {
 	u32		*reg_offsets;	/* register offsets */
 	u8		*mac_addr;	/* MAC addr (only used when
 					   AXFLG_MAC_FROMPLATFORM is used */
+
+	/* uses default ax88796 buffer if set to NULL */
+	void (*block_output)(struct net_device *dev, int count,
+			const unsigned char *buf, int star_page);
+	void (*block_input)(struct net_device *dev, int count,
+			struct sk_buff *skb, int ring_offset);
 };
 
 #endif /* __NET_AX88796_PLAT_H */
-- 
1.7.0.4
