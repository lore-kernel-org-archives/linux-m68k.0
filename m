From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/2] net-next: ax88796: export ax_NS8390_init() hook
Date: Sun, 10 Jun 2018 16:22:38 +1200
Message-ID: <1528604559-972-2-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

The block I/O code for the new X-Surf 100 ax88796 driver needs
ax_NS8390_init() for error fixup in its block_output function.

Export this static function through the ax_NS8390_reinit()
wrapper so we can lose the lib8380.c include in the X-Surf 100
driver.

Fixes: 861928f4e60e826c ("net-next: New ax88796 platform
driver for Amiga X-Surf 100 Zorro board (m68k)")

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 2a0ddec..673d154 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -104,6 +104,13 @@ struct ax_device {
 	return (struct ax_device *)(ei_local + 1);
 }
 
+void ax_NS8390_reinit(struct net_device *dev)
+{
+	ax_NS8390_init(dev, 1);
+}
+
+EXPORT_SYMBOL_GPL(ax_NS8390_reinit);
+
 /*
  * ax_initial_check
  *
-- 
1.7.0.4
