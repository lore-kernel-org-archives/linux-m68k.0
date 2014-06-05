From: Amos Kong <akong@redhat.com>
Subject: [PATCH 2/2] hplance: fix ram size in comment
Date: Thu,  5 Jun 2014 11:01:22 +0800
Message-ID: <1401937282-18345-3-git-send-email-akong@redhat.com>
References: <1401937282-18345-1-git-send-email-akong@redhat.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:17987 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751413AbaFEDBj (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 4 Jun 2014 23:01:39 -0400
In-Reply-To: <1401937282-18345-1-git-send-email-akong@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, netdev@vger.kernel.org, davem@davemloft.net, schwab@linux-m68k.org

drivers/net/ethernet/amd/hplance.h:
 #define HPLANCE_MEMOFF 0x8000   /* struct lance_init_block */
 #define HPLANCE_NVRAMOFF 0xC008 /* etheraddress as one *nibble* per byte */

The offset of RAM start is 0x8000, the offset of RAM end is 0xC008,
so the RAM size is 16392 bytes.

Signed-off-by: Amos Kong <akong@redhat.com>
---
 drivers/net/ethernet/amd/hplance.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/amd/hplance.c b/drivers/net/ethernet/amd/hplance.c
index 47ce57c..6c9de11 100644
--- a/drivers/net/ethernet/amd/hplance.c
+++ b/drivers/net/ethernet/amd/hplance.c
@@ -27,9 +27,9 @@
 
 #include "hplance.h"
 
-/* We have 16834 bytes of RAM for the init block and buffers. This places
+/* We have 16392 bytes of RAM for the init block and buffers. This places
  * an upper limit on the number of buffers we can use. NetBSD uses 8 Rx
- * buffers and 2 Tx buffers.
+ * buffers and 2 Tx buffers, it takes (8 + 2) * 1544 bytes.
  */
 #define LANCE_LOG_TX_BUFFERS 1
 #define LANCE_LOG_RX_BUFFERS 3
-- 
1.9.3
