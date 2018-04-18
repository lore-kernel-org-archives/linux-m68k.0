From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 5/9] net: ax88796: Add block_input/output hooks to ax_plat_data
Date: Wed, 18 Apr 2018 16:26:52 +1200
Message-ID: <1524025616-3722-6-git-send-email-schmitzmic@gmail.com>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

Add platform specific hooks for block transfer reads/writes of packet
buffer data, superseding the default provided ax_block_input/output.
Currently used for m68k Amiga XSurf100.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes in v3:

Suggested by Andrew Lunn/Finn Thain:
- declare struct sk_buff in ax88796.h
- correct whitespace error
---
 drivers/net/ethernet/8390/ax88796.c |   10 ++++++++--
 include/net/ax88796.h               |    9 +++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index ecf104c..29cde38 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -760,8 +760,14 @@ static int ax_init_dev(struct net_device *dev)
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
index b9a3bec..363b0ca 100644
--- a/include/net/ax88796.h
+++ b/include/net/ax88796.h
@@ -12,6 +12,9 @@
 #ifndef __NET_AX88796_PLAT_H
 #define __NET_AX88796_PLAT_H
 
+struct sk_buff;
+struct net_device;
+
 #define AXFLG_HAS_EEPROM		(1<<0)
 #define AXFLG_MAC_FROMDEV		(1<<1)	/* device already has MAC */
 #define AXFLG_HAS_93CX6			(1<<2)	/* use eeprom_93cx6 driver */
@@ -26,6 +29,12 @@ struct ax_plat_data {
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
