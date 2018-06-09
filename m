From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [RFC PATCH 2/2] net-next: xsurf100: drop include of lib8390.c
Date: Sat,  9 Jun 2018 17:57:49 +1200
Message-ID: <1528523869-3403-3-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

Now that ax88796.c exports the ax_NS8390_init() symbol, we can
include 8390.h instead of lib8390.c, avoiding duplication of that
function and killing a few compile warnings in the bargain.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/xsurf100.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/8390/xsurf100.c b/drivers/net/ethernet/8390/xsurf100.c
index 4c6f9cb..32caa5e 100644
--- a/drivers/net/ethernet/8390/xsurf100.c
+++ b/drivers/net/ethernet/8390/xsurf100.c
@@ -33,8 +33,6 @@
 #define HW_CHIPID		0x70
 #define HW_SCRATCH		0x78
 
-#define __NS8390_init ax_NS8390_init
-
 /* force unsigned long back to 'void __iomem *' */
 #define ax_convert_addr(_a) ((void __force __iomem *)(_a))
 
@@ -80,12 +78,10 @@ static void reg_write16(void __iomem *base, u16 reg, u16 val)
 	writew(val, base + reg*4);
 }
 
+#define NS8390_CORE
+#include "8390.h"
 
-
-static unsigned char version[] =
-		"ax88796.c: Copyright 2005,2007 Simtec Electronics\n";
-
-#include "lib8390.c"
+extern void ax_NS8390_init(struct net_device *dev, int startp);
 
 /* from ne.c */
 #define NE_CMD		EI_SHIFT(0x00)
-- 
1.7.0.4
