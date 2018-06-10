From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] net-next: xsurf100: drop include of lib8390.c
Date: Sun, 10 Jun 2018 16:22:39 +1200
Message-ID: <1528604559-972-3-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

Now that ax88796.c exports the ax_NS8390_reinit() symbol, we can
include 8390.h instead of lib8390.c, avoiding duplication of that
function and killing a few compile warnings in the bargain.

Fixes: 861928f4e60e826c ("net-next: New ax88796 platform
driver for Amiga X-Surf 100 Zorro board (m68k)")

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/xsurf100.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/8390/xsurf100.c b/drivers/net/ethernet/8390/xsurf100.c
index e2c9638..1c3e8d1 100644
--- a/drivers/net/ethernet/8390/xsurf100.c
+++ b/drivers/net/ethernet/8390/xsurf100.c
@@ -22,8 +22,6 @@
 #define XS100_8390_DATA_WRITE32_BASE 0x0C80
 #define XS100_8390_DATA_AREA_SIZE 0x80
 
-#define __NS8390_init ax_NS8390_init
-
 /* force unsigned long back to 'void __iomem *' */
 #define ax_convert_addr(_a) ((void __force __iomem *)(_a))
 
@@ -42,10 +40,11 @@
 /* Ensure we have our RCR base value */
 #define AX88796_PLATFORM
 
-static unsigned char version[] =
-		"ax88796.c: Copyright 2005,2007 Simtec Electronics\n";
+#define NS8390_CORE
+#include "8390.h"
 
-#include "lib8390.c"
+/* exported from ax88796.c, especially for our benefit */
+extern void ax_NS8390_reinit(struct net_device *dev);
 
 /* from ne.c */
 #define NE_CMD		EI_SHIFT(0x00)
@@ -232,7 +231,7 @@ static void xs100_block_output(struct net_device *dev, int count,
 		if (jiffies - dma_start > 2 * HZ / 100) {	/* 20ms */
 			netdev_warn(dev, "timeout waiting for Tx RDC.\n");
 			ei_local->reset_8390(dev);
-			ax_NS8390_init(dev, 1);
+			ax_NS8390_reinit(dev);
 			break;
 		}
 	}
-- 
1.7.0.4
