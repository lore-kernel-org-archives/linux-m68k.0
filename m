From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [RFC PATCH 1/2] net-next: ax88796: export ax_NS8390_init() hook
Date: Sat,  9 Jun 2018 17:57:48 +1200
Message-ID: <1528523869-3403-2-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

The block I/O code for the new X-Surf 100 ax88796 driver needs
ax_NS8390_init() for error fixup in its block_output function.

Export this function so we can lose the lib8380.c include in the
X-Surf 100 driver.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 2a0ddec..470142f 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -62,6 +62,8 @@
 
 #include "lib8390.c"
 
+EXPORT_SYMBOL_GPL(ax_NS8390_init);
+
 #define DRV_NAME "ax88796"
 #define DRV_VERSION "1.00"
 
-- 
1.7.0.4
