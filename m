From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 5/8] ax88796: Add block_input/output hooks to ax_plat_data
Date: Tue, 17 Nov 2015 12:33:14 +1300
Message-ID: <1447716797-20906-6-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:33302 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752425AbbKPXdo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:44 -0500
Received: by padfb7 with SMTP id fb7so26783506pad.0
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:43 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>

Add platform specific hooks for block transfer reads/writes of packet
buffer data, superseding the default provided ax_block_input/output.
Currently used for m68k Amiga XSurf100.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   10 ++++++++--
 include/net/ax88796.h               |    7 ++++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 6472473..d45c032 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -789,8 +789,14 @@ static int ax_init_dev(struct net_device *dev)
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
index b9a3bec..28d6a93 100644
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
@@ -26,6 +27,10 @@ struct ax_plat_data {
 	u32		*reg_offsets;	/* register offsets */
 	u8		*mac_addr;	/* MAC addr (only used when
 					   AXFLG_MAC_FROMPLATFORM is used */
+
+        /* uses default ax88796 buffer if set to NULL */
+	void (*block_output)(struct net_device *, int, const unsigned char *, int);
+	void (*block_input)(struct net_device *, int, struct sk_buff *, int);
 };
 
 #endif /* __NET_AX88796_PLAT_H */
-- 
1.7.0.4
